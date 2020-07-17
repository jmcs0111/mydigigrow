contract C {
    function f() external payable returns (uint) { assert(msg.value > 0); return 1; }
    function g() external payable returns (uint) { assert(msg.value > 0); return 2; }

    function h() public returns (uint) {
        assert((true ? this.f{value: 1} : this.g{value: 1})() == 1);
        assert((false ? this.f : this.g){value: 1}() == 2);

        assert([this.f, this.g][0]{value: 1}() == 1);

        // Error: Unable to deduce nameable type for array elements. Try adding explicit type conversion for the first element.
        // assert([this.f{value: 1}, this.g{value: 1}][1]() == 2);

        return 13;
    }
}
// ----
// h() -> 13
