var primaryListBoxOptions = [];
function OnLBAvailableInit() {
    UpdateButtons();
    PushOptions();
}
function UpdateButtons() {
    btAdd.SetEnabled(lbAvailable.GetSelectedItem() != null);
    btAddAll.SetEnabled(lbAvailable.GetItemCount() > 0);
    btRemove.SetEnabled(lbChoosen.GetSelectedItem() != null);
    btRemoveAll.SetEnabled(lbChoosen.GetItemCount() > 0);
}
function GetAllItems(lb) {
    var items = [];
    for (var i = 0; i < lb.GetItemCount(); i++) {
        items.push(lb.GetItem(i));
    }
    return items;
}
function MoveAllItems(lb1, lb2) {
    MoveItems(lb1, lb2, GetAllItems(lb1));
    UpdateButtons();
}
function MoveSelectedItems(lb1, lb2) {
    MoveItems(lb1, lb2, lb1.GetSelectedItems());
    UpdateButtons();
}
function MoveItems(lb1, lb2, items) {
    if (!items) return;
    for (var i = 0; i < items.length; i++) {
        lb2.InsertItem(GetCurrentIndex(items[i].value, lb2), items[i].text, items[i].value);
        lb1.RemoveItem(GetItemIndexByValue(items[i].value, lb1));
    }
}
function AddSelectedItems() {
    MoveSelectedItems(lbAvailable, lbChoosen);
}
function AddAllItems() {
    MoveAllItems(lbAvailable, lbChoosen);
}
function RemoveSelectedItems() {
    MoveSelectedItems(lbChoosen, lbAvailable);
}
function RemoveAllItems() {
    MoveAllItems(lbChoosen, lbAvailable);
}
function GetPrimaryIndex(value) {
    var options = GetPrimaryOptions();
    for (var i = 0; i < options.length; i++)
        if (options[i] == value)
            return i;
}
function GetCurrentIndex(value, lbDestination) {
    var options = GetPrimaryOptions();
    for (var i = (GetPrimaryIndex(value) - 1); i >= 0; i--) {
        var neighborIndex = GetItemIndexByValue(options[i], lbDestination);
        if (neighborIndex != -1)
            return neighborIndex + 1;
    }
    return 0;
}
function GetItemIndexByValue(value, listBox) {
    var itemCount = listBox.GetItemCount();
    for (var i = 0; i < itemCount; i++)
        if (listBox.GetItem(i).value == value)
            return i;
    return -1;
}
function PushOptions() {
    for (var i = 0; i < lbAvailable.GetItemCount(); i++) {
        primaryListBoxOptions.push(lbAvailable.GetItem(i).value);
    }
}
function GetPrimaryOptions() {
    if (primaryListBoxOptions.length == 0)
        PushOptions();
    return primaryListBoxOptions;
}