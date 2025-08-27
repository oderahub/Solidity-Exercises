// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract CodeSize {
    /**
     * The challenge is to create a contract whose runtime code (bytecode) size is greater than 1kb but less than 4kb
     */

    enum Status {
        ACTIVE,
        TERMINATED,
        LEAVE
    }

    struct Mentor {
        string name;
        uint256 joinedTime; 
        Status status;
        bool hasAccess;
    }

    error NOT_OWNER();  

    address[] public mentorsAddress;  

    mapping(address => Mentor) public mappedMentors;

    function createMentor(string memory _name) external { 
        mappedMentors[msg.sender] = Mentor({
            name: _name,  
            joinedTime: block.timestamp,  
            status: Status.ACTIVE,  
            hasAccess: true
        });

        mentorsAddress.push(msg.sender);  // Added semicolon
    }

    function updateMentor(address _mentorAddress, Status _status) external {  // Fixed parameter syntax
        if (msg.sender != _mentorAddress) {  // Fixed comparison operator
            revert NOT_OWNER();
        }

        mappedMentors[_mentorAddress].status = _status;
    }

  
}