pragma ever-solidity >= 0.61.2;
pragma AbiHeader expire;
pragma AbiHeader pubkey;

interface IDstContract {
    function report(
        uint64 roundId,
        uint64 reward,
        uint64 ordinaryStake,
        uint64 vestingStake,
        uint64 lockStake,
        bool reinvest,
        uint8 reason
    ) external;
}
