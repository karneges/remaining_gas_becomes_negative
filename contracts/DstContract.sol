pragma ever-solidity >= 0.61.2;
pragma AbiHeader expire;
pragma AbiHeader pubkey;

import "./IDstContract.sol";
import "locklift/src/console.sol";


contract DstContract is IDstContract {
    uint16 static _nonce;

    constructor() public {
        tvm.accept();
    }

    function report(
        uint64 roundId,
        uint64 reward,
        uint64 ordinaryStake,
        uint64 vestingStake,
        uint64 lockStake,
        bool reinvest,
        uint8 reason
    ) override external {
        tvm.rawReserve(1 ever,0);
        console.log(format("onRoundComplete = {}",address(this).balance));
    }
}
