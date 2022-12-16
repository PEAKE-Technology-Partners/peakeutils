// ==UserScript==
// @name        CW Control - Set Title
// @namespace   Violentmonkey Scripts
// @match       https://help.yourdomain.tld/*
// @grant       none
// @version     1.0
// @author      Jon Rogers
// @description 12/16/2022, 5:43:42 PM
// @run-at      document-idle
// ==/UserScript==
const appendTitle = true;
const observerOptions = {
    childList: true,
    attributes: true,
    subtree: true
  }
const originalTitle = document.title;

function setTitle() {
  const elem = document.querySelector('.DetailTable .Selected .SessionTitle');
  if (elem != null) {
    console.debug(`changed selection to ${elem.innerText}`);
    if (appendTitle) document.title = `${originalTitle}: ${elem.innerText}`;
    else document.title = elem.innerText;
  }
}

(function(){
  window.addEventListener('hashchange', function(){
    // update when selection changed
    setTitle();
  });

  const document_observer = new MutationObserver((mutationList, observer) => {
    // wait for DOM element to exist, then set initial title
    const elem = document.querySelector('.DetailTable .Selected .SessionTitle');
    if (elem != null) {
      setTitle();
      observer.disconnect();
    }
  });
  document_observer.observe(document, observerOptions);
})();
