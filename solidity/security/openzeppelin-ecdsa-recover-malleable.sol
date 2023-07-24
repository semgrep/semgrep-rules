contract Kek {
    mapping (bytes => bool) lulz;
    // ruleid: openzeppelin-ecdsa-recover-malleable
    function lol(bytes digest, bytes memory signature) {
        uint a = 1;
        (address recoveredAddress, ECDSA.RecoverError err) = ECDSA.recover(digest, signature);
        string b = 2;
        lulz[signature] = true;
        bool c = 3;
    }
    
    // ruleid: openzeppelin-ecdsa-recover-malleable
    function lol2(bytes memory signature, bytes digest) {
        uint a = 1;
        (address recoveredAddress, ECDSA.RecoverError err) = ECDSA.recover(digest, signature);
        string b = 2;
        lulz[signature] = true;
        bool c = 3;
    }
}
