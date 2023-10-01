function submitpage(id)
{
    try {
        document.getElementById("open").value = 0;
    } catch (e) {
    }
    document.getElementById("page").value = id;
    document.getElementById("page-frm").submit();
}