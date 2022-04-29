// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

contract Keyboards {
    struct Keyboard {
        KeyboardKind kind;
        bool isPBT;
        string filter;
        address owner;
    }

    enum KeyboardKind {
        SixtyPercent,
        SeventyPercent,
        EightyPercent,
        Iso105
    }

    event TipSent(
        address recipient,
        uint256 amount
    );


    event KeyboardCreated(
        Keyboard keyboard
    );
  Keyboard[] public createdKeyboards;

  function create(KeyboardKind _kind, bool _isPBT, string calldata _filter) external {
      Keyboard memory newKeyboard = Keyboard({
          kind: _kind,
          isPBT: _isPBT,
          filter: _filter,
          owner: msg.sender
      });

      createdKeyboards.push(newKeyboard);
    emit KeyboardCreated(newKeyboard);
  }

  function getKeyboards() view public returns(Keyboard[] memory) {
    return createdKeyboards;
  }

  function tip(uint256 _index) external payable {
      address payable owner = payable(createdKeyboards[_index].owner);
      owner.transfer(msg.value);
      emit TipSent(owner, msg.value);
  }
}
