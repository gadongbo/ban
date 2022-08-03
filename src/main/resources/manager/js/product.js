let redirectBtns = document.querySelectorAll(".btn-redirect");

let curAddress = window.location.href;
let searchParam = new URL(curAddress);
let page = searchParam.search.slice(1);
if (searchParam.search === "") {
  window.location.href = `${searchParam.pathname}?page=1`;
}

let curPage = parseInt(
  page.slice(
    page.indexOf("page=") + "page=".length,
    page.indexOf("&") === -1 ? page.length : page.indexOf("&")
  )
);

redirectBtns.forEach((btn) => {
  btn.addEventListener("click", function (e) {
    e.preventDefault();
    const direct = this.dataset.direct;
    if (direct === "prev") {
      if (curPage === 1) {
        return;
      }
      window.location.href = `${searchParam.pathname}?page=${curPage - 1}`;
    } else {
      /*if (curPage === 2) {
        return;
      } */

      if (!searchParam.search.includes("page=")) {
        window.location.href = `${searchParam.pathname}?page=1`;
      } else
        window.location.href = `${searchParam.pathname}?page=${curPage + 1}`;
    }
  });
});
