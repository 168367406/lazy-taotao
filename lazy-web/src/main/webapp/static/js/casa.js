define("js/pagectrl", function() {
        function e(e, t, n) {
            var r = null,
                i;
            return function() {
                var s = this,
                    o = arguments,
                    u = +(new Date);
                clearTimeout(r), i || (i = u), n && u - i >= n ? (e.apply(s, o), i = u) : r = setTimeout(function() {
                    e.apply(s, o)
                }, t)
            }
        }
        var t = function(e) {
            var t = /(chrome)[ \/]([\w.]+)/.exec(e) || /(webkit)[ \/]([\w.]+)/.exec(e) || /(opera)(?:.*version|)[ \/]([\w.]+)/.exec(e) || /(msie) ([\w.]+)/.exec(e) || e.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(e) || [];
            return {
                browser: t[1] || "",
                version: t[2] || "0",
                isMac: e.indexOf("macintosh") != -1 || e.indexOf("mac os x") != -1
            }
        }(navigator.userAgent.toLowerCase());
        window.uamatch = t,
            function() {
                var e = 0,
                    t = ["webkit", "moz"];
                for (var n = 0; n < t.length && !window.requestAnimationFrame; ++n) window.requestAnimationFrame = window[t[n] + "RequestAnimationFrame"], window.cancelAnimationFrame = window[t[n] + "CancelAnimationFrame"] || window[t[n] + "CancelRequestAnimationFrame"];
                window.requestAnimationFrame || (window.requestAnimationFrame = function(t, n) {
                    var r = (new Date).getTime(),
                        i = Math.max(0, 16.7 - (r - e)),
                        s = window.setTimeout(function() {
                            t(r + i)
                        }, i);
                    return e = r + i, s
                }), window.cancelAnimationFrame || (window.cancelAnimationFrame = function(e) {
                    clearTimeout(e)
                })
            }();
        var n = [],
            r = {
                IS_DEBUG_MODE: !1,
                onInitial: function() {}
            },
            i = function() {
                function e() {
                    this.listeners = {}
                }
                return e.prototype = {
                    addEventListener: function(e, t) {
                        this.listeners[e] || (this.listeners[e] = []), this.listeners[e].push(t)
                    },
                    dispatchEvent: function(e) {
                        var t = this.listeners[e],
                            n = Array.prototype.slice.call(arguments);
                        n.shift(), r.IS_DEBUG_MODE && typeof console != "undefined" && console.info("on	" + e + "	" + n.join(" , "));
                        if (t)
                            for (var i = 0, s = t.length; i < s; i++) t[i].apply(this, n)
                    },
                    removeEventListeners: function(e) {
                        delete this.listeners[e]
                    }
                }, new e
            }(),
            s = $("#container").children(".page, .footer"),
            o = $(window),
            u = $(document.body),
            a = function() {
                var f = {
                        getWdwTop: function() {
                            return document.documentElement.scrollTop || document.body.scrollTop
                        },
                        getWdwHeight: function() {
                            return document.documentElement.clientHeight
                        },
                        getWdwWidth: function() {
                            return document.documentElement.clientWidth
                        },
                        setWdwTop: function() {
                            return t.browser == "chrome" || t.browser == "webkit" ? function(e) {
                                typeof e != "number" && (e = 0), document.body.scrollTop = e
                            } : function(e) {
                                typeof e != "number" && (e = 0), document.documentElement.scrollTop = e
                            }
                        }()
                    },
                    l = function() {
                        var e = a.getWdwHeight();
                        s.each(function(e, t) {
                            n[e] = {
                                offset: t.offsetTop,
                                height: t.clientHeight,
                                name: t.id || "page_" + e
                            }
                        });
                        for (var t = 0; t < n.length; t++) n[t].prev_boundary = n[t].offset + n[t].height / 2 - e;
                        for (var t = 0; t < n.length; t++) n[t].next_boundary = t + 1 + "" in n ? n[t + 1].offset + n[t + 1].height / 2 - e : 1e5;
                        i.dispatchEvent("layoutChanged")
                    },
                    c = function(e, t) {
                        return e >= n[t].prev_boundary && e < n[t].next_boundary
                    },
                    h = new Array(s.length),
                    p = function(e) {
                        var t, r, s = 0,
                            o = a.getWdwTop();
                        for (s = 0; s < n.length; s++) c(o, s) ? h[s] || (h[s] = !0, r = s) : h[s] && (h[s] = !1, t = s);
                        typeof t != "undefined" && i.dispatchEvent("leavingPage", t), typeof r != "undefined" && i.dispatchEvent("enteringPage", r)
                    },
                    d = function() {
                        var e = a.getWdwTop();
                        for (var t = 0; t < f.$pages.length; t++)
                            if (c(e, t)) return t
                    };
                return f.prevNum = function() {
                    var e = d();
                    return e - 1 + "" in n ? e - 1 : 0
                }, f.nextNum = function() {
                    var e = d();
                    return e + 1 + "" in n ? e + 1 : n.length - 1
                }, f.init = function(a) {
                    f.option = $.extend(r, a), f.$pages = s, f.pages = n, f.resetMainLayout = l, f.getNum = d, f.e = i, i.addEventListener("enteringPage", function(e) {
                        if (typeof e == "number" && n[e]) {
                            var r = n[e].name;
                            r && (t.browser == "msie" && t.version < 7 || u.addClass("on" + r), i.dispatchEvent("entering_" + r))
                        }
                    }), i.addEventListener("leavingPage", function(e) {
                        if (typeof e == "number") {
                            var r = n[e].name;
                            r && (t.browser == "msie" && t.version < 7 || u.removeClass("on" + r), i.dispatchEvent("leaving_" + r))
                        }
                    }), r.IS_DEBUG_MODE && (f.statPageInNOuts = h), l(), o.on("resize", e(l, 100, 66)), typeof r.onInitial == "function" && r.onInitial.call(f), o.on("scroll", p), p()
                }, f.uamatch = t, f.immediateScanScroll = p, f
            }();
        return window.pagectrl = a, a
    }), define("js/tween", function() {
        var e = {
            Linear: function(e, t, n, r) {
                return n * e / r + t
            },
            Quad: {
                easeIn: function(e, t, n, r) {
                    return n * (e /= r) * e + t
                },
                easeOut: function(e, t, n, r) {
                    return -n * (e /= r) * (e - 2) + t
                },
                easeInOut: function(e, t, n, r) {
                    return (e /= r / 2) < 1 ? n / 2 * e * e + t : -n / 2 * (--e * (e - 2) - 1) + t
                }
            },
            Cubic: {
                easeIn: function(e, t, n, r) {
                    return n * (e /= r) * e * e + t
                },
                easeOut: function(e, t, n, r) {
                    return n * ((e = e / r - 1) * e * e + 1) + t
                },
                easeInOut: function(e, t, n, r) {
                    return (e /= r / 2) < 1 ? n / 2 * e * e * e + t : n / 2 * ((e -= 2) * e * e + 2) + t
                }
            },
            Quart: {
                easeIn: function(e, t, n, r) {
                    return n * (e /= r) * e * e * e + t
                },
                easeOut: function(e, t, n, r) {
                    return -n * ((e = e / r - 1) * e * e * e - 1) + t
                },
                easeInOut: function(e, t, n, r) {
                    return (e /= r / 2) < 1 ? n / 2 * e * e * e * e + t : -n / 2 * ((e -= 2) * e * e * e - 2) + t
                }
            },
            Quint: {
                easeIn: function(e, t, n, r) {
                    return n * (e /= r) * e * e * e * e + t
                },
                easeOut: function(e, t, n, r) {
                    return n * ((e = e / r - 1) * e * e * e * e + 1) + t
                },
                easeInOut: function(e, t, n, r) {
                    return (e /= r / 2) < 1 ? n / 2 * e * e * e * e * e + t : n / 2 * ((e -= 2) * e * e * e * e + 2) + t
                }
            },
            Sine: {
                easeIn: function(e, t, n, r) {
                    return -n * Math.cos(e / r * (Math.PI / 2)) + n + t
                },
                easeOut: function(e, t, n, r) {
                    return n * Math.sin(e / r * (Math.PI / 2)) + t
                },
                easeInOut: function(e, t, n, r) {
                    return -n / 2 * (Math.cos(Math.PI * e / r) - 1) + t
                }
            },
            Expo: {
                easeIn: function(e, t, n, r) {
                    return e == 0 ? t : n * Math.pow(2, 10 * (e / r - 1)) + t
                },
                easeOut: function(e, t, n, r) {
                    return e == r ? t + n : n * (-Math.pow(2, -10 * e / r) + 1) + t
                },
                easeInOut: function(e, t, n, r) {
                    return e == 0 ? t : e == r ? t + n : (e /= r / 2) < 1 ? n / 2 * Math.pow(2, 10 * (e - 1)) + t : n / 2 * (-Math.pow(2, -10 * --e) + 2) + t
                }
            },
            Circ: {
                easeIn: function(e, t, n, r) {
                    return -n * (Math.sqrt(1 - (e /= r) * e) - 1) + t
                },
                easeOut: function(e, t, n, r) {
                    return n * Math.sqrt(1 - (e = e / r - 1) * e) + t
                },
                easeInOut: function(e, t, n, r) {
                    return (e /= r / 2) < 1 ? -n / 2 * (Math.sqrt(1 - e * e) - 1) + t : n / 2 * (Math.sqrt(1 - (e -= 2) * e) + 1) + t
                }
            },
            Elastic: {
                easeIn: function(e, t, n, r, i, s) {
                    var o;
                    return e == 0 ? t : (e /= r) == 1 ? t + n : (typeof s == "undefined" && (s = r * .3), !i || i < Math.abs(n) ? (o = s / 4, i = n) : o = s / (2 * Math.PI) * Math.asin(n / i), -(i * Math.pow(2, 10 * (e -= 1)) * Math.sin((e * r - o) * 2 * Math.PI / s)) + t)
                },
                easeOut: function(e, t, n, r, i, s) {
                    var o;
                    return e == 0 ? t : (e /= r) == 1 ? t + n : (typeof s == "undefined" && (s = r * .3), !i || i < Math.abs(n) ? (i = n, o = s / 4) : o = s / (2 * Math.PI) * Math.asin(n / i), i * Math.pow(2, -10 * e) * Math.sin((e * r - o) * 2 * Math.PI / s) + n + t)
                },
                easeInOut: function(e, t, n, r, i, s) {
                    var o;
                    return e == 0 ? t : (e /= r / 2) == 2 ? t + n : (typeof s == "undefined" && (s = r * .3 * 1.5), !i || i < Math.abs(n) ? (i = n, o = s / 4) : o = s / (2 * Math.PI) * Math.asin(n / i), e < 1 ? -0.5 * i * Math.pow(2, 10 * (e -= 1)) * Math.sin((e * r - o) * 2 * Math.PI / s) + t : i * Math.pow(2, -10 * (e -= 1)) * Math.sin((e * r - o) * 2 * Math.PI / s) * .5 + n + t)
                }
            },
            Back: {
                easeIn: function(e, t, n, r, i) {
                    return typeof i == "undefined" && (i = 1.70158), n * (e /= r) * e * ((i + 1) * e - i) + t
                },
                easeOut: function(e, t, n, r, i) {
                    return typeof i == "undefined" && (i = 1.70158), n * ((e = e / r - 1) * e * ((i + 1) * e + i) + 1) + t
                },
                easeInOut: function(e, t, n, r, i) {
                    return typeof i == "undefined" && (i = 1.70158), (e /= r / 2) < 1 ? n / 2 * e * e * (((i *= 1.525) + 1) * e - i) + t : n / 2 * ((e -= 2) * e * (((i *= 1.525) + 1) * e + i) + 2) + t
                }
            },
            Bounce: {
                easeIn: function(t, n, r, i) {
                    return r - e.Bounce.easeOut(i - t, 0, r, i) + n
                },
                easeOut: function(e, t, n, r) {
                    return (e /= r) < 1 / 2.75 ? n * 7.5625 * e * e + t : e < 2 / 2.75 ? n * (7.5625 * (e -= 1.5 / 2.75) * e + .75) + t : e < 2.5 / 2.75 ? n * (7.5625 * (e -= 2.25 / 2.75) * e + .9375) + t : n * (7.5625 * (e -= 2.625 / 2.75) * e + .984375) + t
                },
                easeInOut: function(t, n, r, i) {
                    return t < i / 2 ? e.Bounce.easeIn(t * 2, 0, r, i) * .5 + n : e.Bounce.easeOut(t * 2 - i, 0, r, i) * .5 + r * .5 + n
                }
            }
        };
        return e
    }), define("js/pagectrl.snap", ["js/pagectrl", "js/tween"], function(e, t) {
        var n = $(document),
            r = $(document.body),
            i = {
                MAXIMUN: 3,
                MINIMUN: 0,
                doNothing: function() {
                    return !1
                },
                turnonAll: function() {
                    i.ing = !1, document.body.onwheel = null, e.e.dispatchEvent("afterSnap")
                },
                turnoffAll: function() {
                    i.ing = !0, document.body.onwheel = i.doNothing, e.e.dispatchEvent("beforeSnap")
                },
                onwheel: function(e) {
                    var t = function(e) {
                        try {
                            if (e.originalEvent.wheelDelta) return -e.originalEvent.wheelDelta / 120;
                            if (e.originalEvent.detail) return e.originalEvent.detail / 3
                        } catch (t) {}
                        return !1
                    }(e);
                    return t > 0 ? i.snap(!0) : t < 0 && i.snap(!1), e.stopPropagation(), e.preventDefault(), e.cancelBubble = !1, !1
                },
                snap: function(t) {
                    var n;
                    t === !1 ? n = e.prevNum() : n = e.nextNum();
                    var r = e.pages[n].offset + e.pages[n].height - e.getWdwTop() - e.getWdwHeight();
                    i._go(r)
                },
                snapTo: function(t) {
                    try {
                        var n = e.pages[t].offset + e.pages[t].height - e.getWdwTop() - e.getWdwHeight();
                        i._go(n)
                    } catch (r) {}
                },
                _go: function(n) {
                    if (i.ing) return;
                    var r = e.getWdwTop(),
                        s = 0,
                        o = 60;
                    i.turnoffAll(),
                        function u() {
                            s++;
                            var a = t.Expo.easeInOut(s, r, n, o);
                            e.setWdwTop(a), window.scrollTo(0, a), s < o ? requestAnimationFrame(u) : (e.e.dispatchEvent("afterSnapAnimation"), setTimeout(i.turnonAll, 400))
                        }()
                },
                _init: function() {
                    n.on("click", ".js-next-page", function(e) {
                        i.snap(), e.preventDefault()
                    }), uamatch.browser == "msie" && uamatch.version < 8 || (document.body.onmousewheel = function() {
                        return !1
                    }, r.css("overflow", "hidden"), r.on("mousewheel DOMMouseScroll", i.onwheel), r.keydown(function(e) {
                        e.which == 38 || e.which == 33 ? i.snap(!1) : (e.which == 40 || e.which == 34) && i.snap(!0)
                    }), i.initiative = !0)
                }
            };
        return e.snaper = i, Math.tween = t, i._init(), i
    }),
    function() {
        var e = $("#wrap_popup_video"),
            t = $("#wrap_popup_buy"),
            n = $(".popup-wrap");
        $("#btn_watch_intro_video").on("click", function() {
            e.removeClass("dn"), pagectrl.snaper.turnoffAll()
        }), $(".js-btn-buy-popup").on("click", function() {
            t.removeClass("dn"), pagectrl.snaper.turnoffAll()
        }), $(document).on("click", ".js-close-popup", function() {
            n.addClass("dn"), pagectrl.snaper.turnonAll()
        }), require(["js/pagectrl", "js/pagectrl.snap"], function(e, t) {
            function n(e, t, n, r) {
                var i = r * Math.PI / 180;
                return {
                    x: e + n * Math.cos(i),
                    y: t + n * Math.sin(i)
                }
            }

            function r(e) {
                var t = i(e),
                    n = [
                        [t.cx + t.r2 * Math.cos(t.startRadians), t.cy + t.r2 * Math.sin(t.startRadians)],
                        [t.cx + t.r2 * Math.cos(t.closeRadians), t.cy + t.r2 * Math.sin(t.closeRadians)],
                        [t.cx + t.r1 * Math.cos(t.closeRadians), t.cy + t.r1 * Math.sin(t.closeRadians)],
                        [t.cx + t.r1 * Math.cos(t.startRadians), t.cy + t.r1 * Math.sin(t.startRadians)]
                    ],
                    r = t.closeRadians - t.startRadians,
                    s = r % (Math.PI * 2) > Math.PI ? 1 : 0,
                    o = [];
                return o.push("M" + n[0].join()), o.push("A" + [t.r2, t.r2, 0, s, 1, n[1]].join()), o.push("L" + n[2].join()), o.push("A" + [t.r1, t.r1, 0, s, 0, n[3]].join()), o.push("z"), o.join(" ")
            }

            function i(e) {
                var t = {
                        cx: e.centerX || 0,
                        cy: e.centerY || 0,
                        startRadians: (e.startDegrees || 0) * Math.PI / 180,
                        closeRadians: (e.endDegrees || 0) * Math.PI / 180
                    },
                    n = e.thickness !== undefined ? e.thickness : 100;
                return e.innerRadius !== undefined ? t.r1 = e.innerRadius : e.outerRadius !== undefined ? t.r1 = e.outerRadius - n : t.r1 = 200 - n, e.outerRadius !== undefined ? t.r2 = e.outerRadius : t.r2 = t.r1 + n, t.r1 < 0 && (t.r1 = 0), t.r2 < 0 && (t.r2 = 0), t
            }
            var s = {};
            e.init({
                onInitial: function() {
                    var e = this;
                    for (var t = 0; t < e.pages.length; t++)(function(t, n) {
                        e.e.addEventListener("entering_" + n.name, function() {
                            typeof monitor != "undefined" && !s[n.name] && (s[n.name] = !0, monitor.log({
                                c: n.name
                            }, "click"))
                        })
                    })(t, e.pages[t])
                }
            });
            if (t.initiative) {
                var o = $("#wrap_page_inspect"),
                    u = $(document.body);
                o.removeClass("dn"), $(document).on("click", ".js-transfer-page", function(t) {
                    var n = this.getAttribute("data-page");
                    typeof n != "undefined" && e.snaper.snapTo(n), t.preventDefault()
                }), e.e.addEventListener("beforeSnap", function() {
                    u.addClass("page-snapping"), u.removeClass("page-stable")
                }), e.e.addEventListener("afterSnapAnimation", function() {
                    u.addClass("page-stable")
                }), e.e.addEventListener("afterSnap", function() {
                    u.removeClass("page-snapping")
                })
            }
            var a = function() {
                var e = document.createElement("div");
                return e.innerHTML = "<svg/>", (e.firstChild && e.firstChild.namespaceURI) == "http://www.w3.org/2000/svg"
            }();
            if (a) {
                var f = 24,
                    l = f / 2,
                    c = 3,
                    h = 320,
                    p = h / 2,
                    d = p + c,
                    v = h / 2 - f,
                    m = h / 2 - f / 2,
                    g = $("#circle_end"),
                    y = $("#cirucular");

                function b(e) {
                    var t = n(d, d, m, e);
                    g.attr({
                        cx: t.x,
                        cy: t.y
                    }), y.attr({
                        d: r({
                            centerX: d,
                            centerY: d,
                            startDegrees: -90,
                            endDegrees: e,
                            innerRadius: v,
                            outerRadius: p
                        })
                    })
                }
                var w = $("#radar_outer");

                function E() {
                    var t = 0,
                        n = 300,
                        r = 0,
                        i = 80,
                        s = e.getNum();
                    s === 7 ? function o() {
                        var e = Math.tween.Cubic.easeInOut(r, t, n, i);
                        r++, b(e), r < i && requestAnimationFrame(o)
                    }() : b(t)
                }
                e.e.addEventListener("afterSnapAnimation", E), E();

                function S(e, t, n) {
                    var r = null,
                        i;
                    return function() {
                        var s = this,
                            o = arguments,
                            u = +(new Date);
                        clearTimeout(r), i || (i = u), n && u - i >= n ? (e.apply(s, o), i = u) : r = setTimeout(function() {
                            e.apply(s, o)
                        }, t)
                    }
                }
            }
            t.initiative && (e.e.addEventListener("layoutChanged", S(function() {
                var t = e.getNum();
                e.snaper.snapTo(t)
            }, 200)), e.getNum() == 0 && ($("#scroll_hint").fadeIn(), e.e.addEventListener("afterSnapAnimation", function() {
                e.e.dispatchEvent("firstSnap")
            }), e.e.addEventListener("firstSnap", function() {
                $("#scroll_hint").fadeOut(), e.e.removeEventListeners("firstSnap")
            })))
        })
    }();
