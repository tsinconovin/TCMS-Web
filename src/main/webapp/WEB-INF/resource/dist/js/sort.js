
function sortTableFromSmallest(column, type) {
    var rows = $('#table1 tbody  tr').get();
    rows.sort(function (a, b) {
        var A = 0;
        var B = 0;
        if (type === 1) {
            A = Number($(a).children('td').eq(column).text().toUpperCase());
            B = Number($(b).children('td').eq(column).text().toUpperCase());
        }
        if (type === 0) {
            A = Number($(a).children('td').eq(column).text().replaceAll(",", "").toUpperCase());
            B = Number($(b).children('td').eq(column).text().replaceAll(",", "").toUpperCase());
        }

        if (A < B) {
            return -1;
        }

        if (A > B) {
            return 1;
        }

        return 0;
    });
    $.each(rows, function (index, row) {
        $('#table1').children('tbody').append(row);
    });
}
function sortTableFromLargest(column, type) {
    var rows = $('#table1 tbody  tr').get();
    rows.sort(function (a, b) {

        if (type === 1) {
            A = Number($(a).children('td').eq(column).text().toUpperCase());
            B = Number($(b).children('td').eq(column).text().toUpperCase());
        }
        if (type === 0) {
            A = Number($(a).children('td').eq(column).text().replaceAll(",", "").toUpperCase());
            B = Number($(b).children('td').eq(column).text().replaceAll(",", "").toUpperCase());
        }

        if (A > B) {
            return -1;
        }

        if (A < B) {
            return 1;
        }

        return 0;
    });
    $.each(rows, function (index, row) {
        $('#table1').children('tbody').append(row);
    });
}

function sort(id, column, type) {
    if ($('#' + id).hasClass('fa-arrow-circle-o-down')) {
        document.getElementById(id).className = 'fa fa-arrow-circle-o-up';
        sortTableFromSmallest(column, type);
    } else {
        document.getElementById(id).className = 'fa fa-arrow-circle-o-down';
        sortTableFromLargest(column, type);
    }
}

