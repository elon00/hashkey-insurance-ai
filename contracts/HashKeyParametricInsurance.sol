// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title HashKeyParametricInsurance
 * @dev Institutional RWA & DeFi Exploit Parametric Insurance on HashKey Chain
 */
contract HashKeyParametricInsurance {
    struct Policy {
        address policyHolder;
        uint256 coverageAmount;
        uint256 premiumPaid;
        uint256 expiration;
        bytes32 zkKycHash;
        bool isClaimed;
        bool isActive;
    }

    mapping(bytes32 => Policy) public policies;
    address public immutable insurerTreasury;
    uint256 public totalClaimsSettled;

    event PolicyUnderwritten(bytes32 indexed policyId, address indexed holder, uint256 coverage, uint256 premium);
    event ClaimSettled(bytes32 indexed policyId, address indexed holder, uint256 payout, bytes32 oracleProof);

    constructor(address _treasury) {
        require(_treasury != address(0), "Invalid treasury");
        insurerTreasury = _treasury;
    }

    function underwritePolicy(bytes32 policyId, uint256 duration, bytes32 zkKycHash) external payable {
        require(msg.value > 0, "Premium required");
        require(!policies[policyId].isActive, "Policy already exists");

        uint256 coverage = msg.value * 20; // 20x leverage pool coverage
        policies[policyId] = Policy({
            policyHolder: msg.sender,
            coverageAmount: coverage,
            premiumPaid: msg.value,
            expiration: block.timestamp + duration,
            zkKycHash: zkKycHash,
            isClaimed: false,
            isActive: true
        });

        emit PolicyUnderwritten(policyId, msg.sender, coverage, msg.value);
    }

    function settleClaim(bytes32 policyId, bytes32 oracleProof) external {
        Policy storage p = policies[policyId];
        require(p.isActive, "Policy inactive");
        require(!p.isClaimed, "Already claimed");
        require(block.timestamp <= p.expiration, "Policy expired");

        p.isClaimed = true;
        p.isActive = false;
        totalClaimsSettled += 1;

        payable(p.policyHolder).transfer(p.coverageAmount);
        emit ClaimSettled(policyId, p.policyHolder, p.coverageAmount, oracleProof);
    }
}
