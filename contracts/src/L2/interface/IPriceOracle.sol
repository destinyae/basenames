//SPDX-License-Identifier: MIT
pragma solidity >=0.8.17 <0.9.0;

interface IPriceOracle {
    struct Price {
        uint256 base_usdc;
        uint256 premium_usdc;
        uint256 base_wei;
        uint256 premium_wei;
    }

    /**
     * @dev Returns the price to register or renew a name.
     * @param name The name being registered or renewed.
     * @param expires When the name presently expires (0 if this is a new registration).
     * @param duration How long the name is being registered or extended for, in seconds.
     * @return base premium tuple of base price + premium price
     */
    function price(string calldata name, uint256 expires, uint256 duration) external view returns (Price calldata);

    function attoUSDToWei(uint256 amount) external view returns (uint256);
}