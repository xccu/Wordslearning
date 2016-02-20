function autoRowSpan(tb, row, col) {
    var lastValue = "";
    var value = "";
    var pos = 1;
    var st = "";
    for (var i = row; i < tb.rows.length; i++) {
        if (i > 0)
            st = tb.rows[i - 1].style.display;
        value = tb.rows[i].cells[col].innerText;
        if (lastValue == value && st != "none") {
            tb.rows[i].deleteCell(col);
            tb.rows[i - pos].cells[col].rowSpan = tb.rows[i - pos].cells[col].rowSpan + 1;
            tb.rows[i].deleteCell(col);
            tb.rows[i - pos].cells[col + 1].rowSpan = tb.rows[i - pos].cells[col + 1].rowSpan + 1;
            pos++;
        } else {
            lastValue = value;
            pos = 1;
        }
    }
}