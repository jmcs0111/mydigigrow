contract test {
    function f() public pure returns (string memory) {
        return "😃, 😭, and 😈";
    }
    function g() public pure returns (string memory) {
        return unicode"😃, 😭, and 😈";
    }
}
// ----
// SyntaxError 5811: (86-108): Non-ASCII characters found
