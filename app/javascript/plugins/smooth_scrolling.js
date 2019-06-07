const elements = document.querySelectorAll('a[href*="#"]');

const smoothScrolling = () => {
  elements.forEach((element) => {
    element.addEventListener("click", (event) => {
      let hashval = element.getAttribute('href')
      let target = document.querySelector(hashval)
      target.scrollIntoView({
        behavior: "smooth",
        block: "start"
      })
      history.pushState(null, null, hashval)
      event.preventDefault()
    });
  })
};

export { smoothScrolling };


