// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IUniswapV2Router {
    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
}

interface IUniswapV2Factory {
    function getPair(address token0, address token1) external view returns (address);
    function createPair(address tokenA, address tokenB) external returns (address pair);
}

contract UniswapV2AddLiquidity {
    address private constant FACTORY = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private constant ROUTER = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;

    function addLiquidity(
        address _tokenA,
        address _tokenB,
        uint _amountA,
        uint _amountB
    ) external returns (uint amountA, uint amountB, uint liquidity) {
        address pair = IUniswapV2Factory(FACTORY).getPair(_tokenA, _tokenB);
        if (pair != address(0)) {
            pair = IUniswapV2Factory(FACTORY).createPair(_tokenA, _tokenB);
        }

        safeTransferFrom(IERC20(_tokenA), msg.sender, address(this), _amountA);
        safeTransferFrom(IERC20(_tokenB), msg.sender, address(this), _amountB);

        safeApprove(IERC20(_tokenA), ROUTER, _amountA);
        safeApprove(IERC20(_tokenB), ROUTER, _amountB);

        (amountA, amountB, liquidity) = IUniswapV2Router(ROUTER)
            .addLiquidity(
                _tokenA,
                _tokenB,
                _amountA,
                _amountB,
                0,
                0,
                address(this),
                block.timestamp
            );
    }

    /**
     * @dev The transferFrom function may or may not return a bool.
     * The ERC-20 spec returns a bool, but some tokens don't follow the spec.
     * Need to check if data is empty or true.
     */
    function safeTransferFrom(
        IERC20 token,
        address sender,
        address recipient,
        uint amount
    ) internal {
        (bool success, bytes memory returnData) = address(token).call(
            abi.encodeCall(IERC20.transferFrom, (sender, recipient, amount))
        );
        require(
            success && (returnData.length == 0 || abi.decode(returnData, (bool))),
            "Transfer from failed!"
        );
    }

    /**
     * @dev The approve function may or may not return a bool.
     * The ERC-20 spec returns a bool, but some tokens don't follow the spec.
     * Need to check if data is empty or true.
     */
    function safeApprove(IERC20 token, address spender, uint amount) internal {
        (bool success, bytes memory returnData) = address(token).call(
            abi.encodeCall(IERC20.approve, (spender, amount))
        );
        require(
            success && (returnData.length == 0 || abi.decode(returnData, (bool))),
            "Approve failed!"
        );
    }
}