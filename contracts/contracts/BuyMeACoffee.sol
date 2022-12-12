// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.8;

contract BuyMeACoffee {
    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }

    Memo[] memos;

    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    /**
     * @dev buy a coffee for the owner
     * @param _name name of the buyer
     * @param _message message from the buyer
     */

    function buyCoffee(
        string memory _name,
        string memory _message
    ) public payable {
        require(msg.value > 0, "No money....No cofffee");

        memos.push(Memo(msg.sender, block.timestamp, _name, _message));
        emit NewMemo(msg.sender, block.timestamp, _name, _message);
    }

    /**
     * @dev send the balance of contract to the owner
     */

    function withdrawTips() public {
        require(owner.send(address(this).balance));
    }

    /**
     * @dev get all the memos stored on the blockchain
     */

    function getMemos() public view returns (Memo[] memory) {
        return memos;
    }
}
