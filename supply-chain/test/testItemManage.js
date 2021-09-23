const ItemManager = artifacts.require('./ItemManager.sol')

contract('ItemManager', accounts => {
    it('should add an item', async () => {
        const itemManagerInstance = await ItemManager.deployed()
        const itemName = 'Test1'
        const itemPrice = 500

        const result = await itemManagerInstance.createItem(itemName, itemPrice, {from: accounts[0]})
        console.log(result)
        assert.equal(result.logs[0].args._itemIndex, 0, 'This is not the first item')

        const item = await itemManagerInstance.items(0)
        assert.equal(item._identifier, itemName, 'Is not the same identifier')
    })
})