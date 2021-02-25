# Program hash: 0x02bb25e03624218e0211798da4064586ea37958590167006bff1be82e0d99858.

%builtins output pedersen ecdsa

from starkware.cairo.common.cairo_builtins import HashBuiltin, SignatureBuiltin
from starkware.cairo.common.hash import pedersen_hash
from starkware.cairo.common.signature import verify_ecdsa_signature

func main(output_ptr : felt*, pedersen_ptr : HashBuiltin*, ecdsa_ptr : SignatureBuiltin*) -> (
        output_ptr : felt*, pedersen_ptr : HashBuiltin*, ecdsa_ptr : SignatureBuiltin*):
    alloc_locals

    local your_eth_addr
    local signature_r
    local signature_s

    let (pedersen_ptr, x) = pedersen_hash(pedersen_ptr, your_eth_addr, your_eth_addr)
    let (ecdsa_ptr) = verify_ecdsa_signature(
        ecdsa_ptr,
        x,
        124221662027375191599785306371100866827147974414679244246692561282978781776,
        signature_r,
        signature_s)
        
    %{
        ids.your_eth_addr = 3
        ids.signature_r = 5
        ids.signature_s = 4
        ids.x = # hash value 
        memory[ids.output_ptr] = 0x123456789a
    %}

    assert [output_ptr] = your_eth_addr
    
    

    return (output_ptr=output_ptr + 1, pedersen_ptr=pedersen_ptr, ecdsa_ptr=ecdsa_ptr)
end
