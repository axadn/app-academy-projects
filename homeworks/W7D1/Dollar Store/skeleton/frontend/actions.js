const selectCurrency = function(baseCurrency, rates){
    return {type: "SWITCH_CURRENCY", baseCurrency, rates};
}

export default selectCurrency;
