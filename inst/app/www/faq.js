$(document).ready(function() {
    // Initialize each FAQ item with a closed state and down arrow
    $('.faq-answer').hide();
    $('.faq-question .arrow').text(String.fromCharCode(0xf107)); // Set the initial down arrow

    // On click, toggle the answer visibility and update the arrow
    $('.faq-question').on('click', function() {
        const answer = $(this).next('.faq-answer');
        const arrow = $(this).find('.arrow');

        // Toggle answer visibility
        answer.slideToggle(300);

        // Toggle arrow state between down and up
        if (arrow.text() === String.fromCharCode(0xf107)) { // If down arrow
            arrow.text(String.fromCharCode(0xf106)); // Set to up arrow
        } else {
            arrow.text(String.fromCharCode(0xf107)); // Set back to down arrow
        }
    });
});