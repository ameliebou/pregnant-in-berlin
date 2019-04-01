const timeline = () => {
  const timelineBoxes = document.querySelectorAll('.timeline-panel');
  timelineBoxes.onscroll = (e => {
      console.log(e);
    })
};

export { timeline };
