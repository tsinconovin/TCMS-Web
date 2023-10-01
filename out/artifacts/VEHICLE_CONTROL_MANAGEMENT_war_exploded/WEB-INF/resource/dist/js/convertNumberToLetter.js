
    //created by Mohammadian
    "use strict";
    var delimiter = " و ", zero = "صفر", negative = "منفی ", letters = [["", "یک", "دو", "سه", "چهار", "پنج", "شش", "هفت", "هشت", "نه"], ["ده", "یازده", "دوازده", "سیزده", "چهارده", "پانزده", "شانزده", "هفده", "هجده", "نوزده", "بیست"], ["", "", "بیست", "سی", "چهل", "پنجاه", "شصت", "هفتاد", "هشتاد", "نود"], ["", "یکصد", "دویست", "سیصد", "چهارصد", "پانصد", "ششصد", "هفتصد", "هشتصد", "نهصد"], ["", " هزار", " میلیون", " میلیارد", " هزار ", " بیلیارد", " تریلیون", " تریلیارد", "کوآدریلیون", " کادریلیارد", " کوینتیلیون", " کوانتینیارد", " سکستیلیون", " سکستیلیارد", " سپتیلیون", "سپتیلیارد", " اکتیلیون", " اکتیلیارد", " نانیلیون", " نانیلیارد", " دسیلیون", " دسیلیارد"]], decimalSuffixes = ["", "دهم", "صدم", "هزارم", "ده‌هزارم", "صد‌هزارم", "میلیونوم", "ده‌میلیونوم", "صدمیلیونوم", "میلیاردم", "ده‌میلیاردم", "صد‌‌میلیاردم"], prepareNumber = function (e) {
        var r = e;
        "number" == typeof r && (r = r.toString());
        var t = r.length % 3;
        return 1 === t ? r = "00".concat(r) : 2 === t && (r = "0".concat(r)), r.replace(/\d{3}(?=\d)/g, "$&*").split("*")
    }, threeNumbersToLetter = function (e) {
        if (0 === parseInt(e, 0))
            return"";
        var r = parseInt(e, 0);
        if (r < 10)
            return letters[0][r];
        if (r <= 20)
            return letters[1][r - 10];
        if (r < 100) {
            var t = r % 10, n = (r - t) / 10;
            return t > 0 ? letters[2][n] + delimiter + letters[0][t] : letters[2][n]
        }
        var i = r % 10, s = (r - r % 100) / 100, u = (r - (100 * s + i)) / 10, a = [letters[3][s]], l = 10 * u + i;
        return l > 0 && (l < 10 ? a.push(letters[0][l]) : l <= 20 ? a.push(letters[1][l - 10]) : (a.push(letters[2][u]), i > 0 && a.push(letters[0][i]))), a.join(delimiter)
    }, convertDecimalPart = function (e) {
        return"" === (e = e.replace(/0*$/, "")) ? "" : (e.length > 11 && (e = e.substr(0, 11)), " ممیز " + Num2persian(e) + " " + decimalSuffixes[e.length])
    }, Num2persian = function (e) {
        e = e.toString().replace(/[^0-9.-]/g, "");
        var r = !1, t = parseFloat(e);
        if (isNaN(t))
            return zero;
        if (0 === t)
            return zero;
        t < 0 && (r = !0, e = e.replace(/-/g, ""));
        var n = "", i = e, s = e.indexOf(".");
        if (s > -1 && (i = e.substring(0, s), n = e.substring(s + 1, e.length)), i.length > 66)
            return"خارج از محدوده";
        for (var u = prepareNumber(i), a = [], l = u.length, o = 0; o < l; o += 1) {
            var p = letters[4][l - (o + 1)], c = threeNumbersToLetter(u[o]);
            "" !== c && a.push(c + p)
        }
        return n.length > 0 && (n = convertDecimalPart(n)), (r ? negative : "") + a.join(delimiter) + n
    };
    String.prototype.toPersianLetter = function () {
        return Num2persian(this)
    }, Number.prototype.toPersianLetter = function () {
        return Num2persian(parseFloat(this).toString())
    };