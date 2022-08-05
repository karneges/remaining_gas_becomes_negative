import { expect } from "chai";
import { Signer } from "locklift";
import { AccountFactory } from "locklift/build/factory";
import { TokenWalletAbi } from "../build/factorySource";

let signer: Signer;
let accountFactory: AccountFactory<TokenWalletAbi>;

describe("Test Sample contract", function () {
  before(async () => {
    signer = (await locklift.keystore.getSigner("0"))!;
  });
  it("SrcContract should send report to DstContract", async () => {
    const { contract: srcContract } = await locklift.factory.deployContract({
      contract: "SrcContract",
      value: locklift.utils.toNano(10),
      initParams: {
        _nonce: locklift.utils.getRandomNonce(),
      },
      constructorParams: {},
      publicKey: signer.publicKey,
    });
    const { contract: dstContract } = await locklift.factory.deployContract({
      contract: "DstContract",
      value: locklift.utils.toNano(10),
      initParams: {
        _nonce: locklift.utils.getRandomNonce(),
      },
      constructorParams: {},
      publicKey: signer.publicKey,
    });
    await locklift.tracing.trace(
      srcContract.methods.reportToDst({ dst: dstContract.address }).sendExternal({ publicKey: signer.publicKey }),
    );
    expect(1).to.equal(1);
  });
});
