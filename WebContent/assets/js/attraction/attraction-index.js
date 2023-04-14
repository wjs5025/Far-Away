document.getElementById("btn-search").addEventListener("click", function () {
    let sidoCode = document.getElementById("sidoCode").value;
    let gugunCode = document.getElementById("gugunCode").value;
    let contentTypeId = document.getElementById("contentTypeId").value;

    const url = `/attraction?action=list&sidoCode=${sidoCode}&gugunCode=${gugunCode}&contentTypeId=${contentTypeId}`;
    // const url = `/region?sidoCode=${sidoCode}`;
    fetch(url)
        .then((res) => res.json())
        .then((data) => {
            console.log(data);
            // makeRegionList(data);
        });
});

let pages = document.querySelectorAll(".page-link");
pages.forEach(function (page) {
    page.addEventListener("click", function () {
        console.log(this.parentNode.getAttribute("data-pg"));
        document.querySelector("#p-action").value = "list";
        document.querySelector("#p-page-no").value = this.parentNode.getAttribute("data-pg");
        document.querySelector("#p-sido-code").value = "${param.sidoCode}";
        document.querySelector("#p-gugun-code").value = "${param.gugunCode}";
        document.querySelector("#p-content-type-id").value = "${param.contentTypeId}";
        document.querySelector("#form-param").submit();
    });
});

window.onload = () => {
    getRegionData();
    // displayMarker();
}