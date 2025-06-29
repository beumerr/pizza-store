if (typeof window !== "undefined") {
  function init() {
    document.body.style.overflow = "hidden"
  }

  if (document.readyState === "complete" || document.readyState === "interactive") {
    // Document has already finished loading
    init()
  } else {
    // Still loading — wait for DOMContentLoaded
    document.addEventListener("DOMContentLoaded", init)
  }
}
