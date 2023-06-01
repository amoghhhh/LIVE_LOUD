const {ethers}=require("hardhat")
const {assert}=require("chai")

describe("Lock", function () {

    let lockfactory
    let lock

    beforeEach(async function(){
        lockfactory = await ethers.getContractFactory("Lock")
        lock = await lockfactory.deploy()
    })


    it("hello this is first it block",async function(){
        const currvalue = await lock.retrieve()
        const expectvalue="0"
        assert.equal(currvalue.toString(),expectvalue)
    })
})