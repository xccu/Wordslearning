var TINY = {};

function T$(i) { return document.getElementById(i) }
function T$$(e, p) { return p.getElementsByTagName(e) }

TINY.setPage = function () {
    function pager(url, pagecount) { this.url = url; this.pagecount = pagecount; }
    pager.prototype.skipPage = function (obj) {
        Index = $(obj).val();
        skip(Index);
    };
    pager.prototype.lastPage = function () {
        skip(pagecount);
    };
    pager.prototype.firstPage = function () {
        skip(1);
    };
    pager.prototype.nextPage = function (Index) {
        Index = Index == pagecount ? Index : Index + 1;
        skip(Index);
    };
    pager.prototype.previouPage = function (Index) {
        Index = Index == "1" ? "1" : Index - 1;
        skip(Index);
    };
    function skip(Index) {
        $.post("/Words/PageSkip", { Index: Index }, function (data) {
            if (data.IsSuccess) {
                window.location = url + '/?Page=' + data.Index;
            }
            else {
                alert("Skip failed");
                window.location = url
            }
        })
    };
    return { pager: pager }
}();