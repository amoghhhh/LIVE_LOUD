// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract Lock is ERC721 
{
    constructor(string memory name_, string memory symbol_)ERC721(name_,symbol_) {}
    uint public nextTokenId = 1;
    struct Post 
    {
        string content;
        address author;
        uint timestamp;
        uint[] commentIds;
    }
    struct Comment 
    {
        string content;
        address author;
        uint timestamp;
    }
    mapping(uint=>Post)public posts;
    mapping(uint => Comment) public comments;
    function createPost(string memory content_) public returns (uint) 
    {
        uint tokenId=nextTokenId;
        Post memory post=Post(content_,msg.sender,block.timestamp, new uint[](0));
        posts[tokenId]=post;
        _mint(msg.sender,tokenId);
        nextTokenId++;
        return tokenId;
    }

    function getPost(uint tokenId) public view returns (string memory, address, uint, uint[] memory) 
    {
        require(_exists(tokenId), "Invalid token ID");
        Post memory post = posts[tokenId];
        return (post.content, post.author, post.timestamp, post.commentIds);
    }

    function writeComment(uint tokenId, string memory content_) public returns (uint) 
    {
        require(_exists(tokenId), "Invalid token ID");
        Comment memory comment = Comment(content_, msg.sender, block.timestamp);
        uint commentId = posts[tokenId].commentIds.length;
        comments[commentId] = comment;
        posts[tokenId].commentIds.push(commentId);
        return commentId;
    }

    function getComment(uint commentId) public view returns (string memory, address, uint) 
    {
        require(comments[commentId].timestamp != 0, "Invalid comment ID");
        Comment memory comment = comments[commentId];
        return (comment.content, comment.author, comment.timestamp);
    }
}
