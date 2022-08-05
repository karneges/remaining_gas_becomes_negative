pragma ever-solidity >= 0.61.2;
pragma AbiHeader expire;
pragma AbiHeader pubkey;
import "./IDstContract.sol";



contract SrcContract {
    uint16 static _nonce;

    constructor() public {
        tvm.accept();
    }

    function reportToDst(address dst) external {
        tvm.accept();
        IDstContract(dst).report(
            0,
            1 ever,
            10 ever,
            0,
            0,
            true,
            1
        );
    }
}
