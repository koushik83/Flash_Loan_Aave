pragma solidity =0.5.0;

import 'https://github.com/aave/aave-protocol/blob/master/contracts/configuration/LendingPoolAddressesProvider.sol';
import 'https://github.com/aave/aave-protocol/blob/master/contracts/lendingpool/LendingPool.sol';
import 'https://github.com/aave/aave-protocol/blob/master/contracts/flashloan/base/FlashLoanReceiverBase.sol';

contract Borrower is FlashLoanReceiverBase
{
LendingPoolAddressesProvider protocol;
address _dai;

constructor (address _provider, address _dai) 
FlashLoanReceiverBase (_provider)
public 
{
provider = LendingPoolAddressesProvider(_provider);
dai = _dai;
}

function getLoan (unint amount, bytes calldata _params) external 
{
LendingPool lendingpool = LendingPool (provider.getLendingPool());
lendingpool.flashloan(address(this), dai,amount,_params);
}

function ProcessLoan( address _address, uint _amount, uint _fee, bytes memory _params)
external 
{

transferFundsBackToPoolInternal (_reserve, amount + fee);

}

}
