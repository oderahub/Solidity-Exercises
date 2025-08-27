// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract CrossContract {
    /**
     * The function below is to call the price function of PriceOracle1 and PriceOracle2 contracts below and return the lower of the two prices
     */


    

    function getLowerPrice(
        address _priceOracle1,
        address _priceOracle2
    ) external view returns (uint256) {
        // your code here

        uint256 oraclePrice1 = PriceOracle(_priceOracle1).price();
        uint256 oraclePrice2 = PriceOracle(_priceOracle2).price();

        if (oraclePrice1 <= oraclePrice2) {
            return oraclePrice1;
        }else {
            return oraclePrice2;
        }
    }
}

contract PriceOracle1 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}

contract PriceOracle2 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}
interface PriceOracle {
        function price() external view returns(uint256);
}