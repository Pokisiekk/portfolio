*** Settings ***
Resource            ../components/nav_bar.robot
Resource            ../components/search.robot

*** Variables ***
${ACCEPT_ALL_BTN}            css=button:has-text("Accept all")
${INPUT_SEARCH}              css=input[name="search_query"]
${SEARCH_BUTTON}             css=button.ytSearchboxComponentSearchButton
${TRENDING_TITILE}           css=h1 span:has-text("Trending")
${MOVIES_TITILE}             css=h1 span:has-text("Movies")
${LIVE_TITILE}               css=h1 span:has-text("Live")
${MUSIC_TITILE}              css=yt-formatted-string#title:has-text("Music")
