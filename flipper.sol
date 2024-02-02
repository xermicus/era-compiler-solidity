contract Flipper {
    bool flip;

    constructor() payable {
        flip = true;
    }

    function flipper() public payable {
        flip = !flip;
    }
}
