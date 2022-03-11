import copy
import pandas as pd


def calculate_stock_gross_clean(block_height, verbose=False):
    init_block_reward = 50
    blocks_per_halving = 210000
    
    if block_height < blocks_per_halving:
        # If in the first 210K Blocks, multiply by 50
        return block_height * init_block_reward
    else:
        remaining_blocks = copy.deepcopy(block_height)
        stock_gross = 0 
        
        i = 1    
        
        # Total number of bitcoins is 50 * 210000 + 25 * 210000 + ... + (BTC subsidy per block * remaining blocks)
        while remaining_blocks >= blocks_per_halving:
            
            stock_gross += (min(remaining_blocks, blocks_per_halving) * (init_block_reward / (2 ** (i-1) ) ) )
            i += 1
            remaining_blocks -= 210000        
        
        stock_gross += ((min(remaining_blocks, blocks_per_halving)) * (init_block_reward / (2 ** (i-1) ) ) )
        
        # Genesis block (50 coins) is unspendable, so this function adds (50 - LAST_SUBSIDY) too many blocks:
        stock_gross -= (50 - (init_block_reward / (2 ** (i-1) )))
        
        return stock_gross

