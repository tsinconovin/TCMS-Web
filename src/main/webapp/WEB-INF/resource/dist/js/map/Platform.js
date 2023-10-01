function showPlatform(c) {
    for (var i = 1; i <= c; i++) {
        var pf = Number(document.getElementById("pf" + i).innerHTML);
        switch (pf) {
            case 1:
                document.getElementById("pf" + i).innerHTML = "G4B";
                break;
            case 2:
                document.getElementById("pf" + i).innerHTML = "ثبت دستی در سیستم";
                break;
            default:
                document.getElementById("pf" + i).innerHTML = "-";
                break;
        }
    }
}