function promotionDailySelection(current_form){
    var promotionSelector = current_form["promotion_id_selector"];
    current_form["promotion_id"].value = promotionSelector.options[promotionSelector.selectedIndex].value;

    return true;
}