function mutePosts(i, b) {
    let j = 0;
    let s = 0;
    while (true) {
        if (s >= 2) break;
        if (j === i) {
            j++;
            continue;
        }
        let p = document.getElementById("post"+j);
        if (!p) {
            s++;
            j++;
            continue;
        }
        if (b) {
            p.classList.add("mute");
            let c = document.getElementById("content"+j);
            c.classList.add("hide");
        } else {
            p.classList.remove("mute");
        }
        j++;
    }
}

function showPost(i) {
    let p = document.getElementById("post"+i);
    let c = document.getElementById("content"+i);
    if (c.classList.contains("hide")) {
        p.classList.remove("mute");
        c.classList.remove("hide");
        mutePosts(i, true);
        p.scrollIntoView();
    } else {
        c.classList.add("hide");
        mutePosts(i, false);
    }
}
