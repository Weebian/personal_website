/**$(function () {
    $('#app').html('<h2>hi</h2>');
    //Menu stuff
    $(".menuButton").click(function () {
        if ($('.menuItems').is(':hidden')) {
            $('.menuItems').show();
        }
        else {
            $('.menuItems').hide();
        }
    });

    $(window).resize(function () {
        if ($(window).width() > 760) {
            $('.menuItems').show();
            $('.menuItems').css('display', 'inline');
        }
    });
});
*/
//Jump
const jump = new Vue({
    el: '#jump',
    methods: {
        scroll: function (message) {
            // Refer to https://stackoverflow.com/questions/18071046/smooth-scroll-to-specific-div-on-click/18071231
            // Obtain DOM element of target
            var target = document.getElementById(message)
            var scrollContainer = target;

            do { //find scroll container
                scrollContainer = scrollContainer.parentNode;
                if (!scrollContainer) return;
                scrollContainer.scrollTop += 1;
            } while (scrollContainer.scrollTop == 0);
            
            var targetY = 0;
            do { //find the top of target relatively to the container
                if (target == scrollContainer) break;
                targetY += target.offsetTop;
            } while (target = target.offsetParent);
            
            scroll = function(c, a, b, i) {
                i++; if (i > 25) return;
                c.scrollTop = a + (b - a) / 25 * i;
                setTimeout(function(){ scroll(c, a, b, i); }, 20);
            }
            // start scrolling
            scroll(scrollContainer, scrollContainer.scrollTop, targetY, 0);
        }
    }
})

// Filter
const tool_filter = new Vue({
    el: '#tool_filter',
    methods: {
            filter: function(){
                // Obtain all selected options
                const selected = document.querySelectorAll('#tool_filter option:checked');
                const values = Array.from(selected).map(el => el.value);

                // Obtain filter type
                let filter_type = document.getElementById('filter_type').value;

                //Remove any empty selections
                let index = values.indexOf("");
                if (index > -1) {
                    values.splice(index, 1);
                }

                // Filter projects
                let sections = document.getElementsByTagName("section");
                for (let i = 2; i < sections.length; i++){
                    if (filter_check(values, sections[i].className.split(','), filter_type)){
                        sections[i].style.display = "block"
                    }
                    else{
                        sections[i].style.display = "none"
                    }
                };
                
            }
    }
})
// Filter type
const tool_filter_type = new Vue({
    el: '#filter_type',
    methods: {
            filter: function(){
                // Obtain all selected options
                const selected = document.querySelectorAll('#tool_filter option:checked');
                const values = Array.from(selected).map(el => el.value);

                // Obtain filter type
                let filter_type = document.getElementById('filter_type').value;

                //Remove any empty selections
                let index = values.indexOf("");
                if (index > -1) {
                    values.splice(index, 1);
                }

                // Filter projects
                let sections = document.getElementsByTagName("section");
                for (let i = 2; i < sections.length; i++){
                    if (filter_check(values, sections[i].className.split(','), filter_type)){
                        sections[i].style.display = "block"
                    }
                    else{
                        sections[i].style.display = "none"
                    }
                };
                
            }
    }
})

// Help check filters
function filter_check(filters, tools, filter_type){
    if(filter_type == 'and'){
        return filters.every(x => tools.includes(x));
    }
    else{
        return filters.some(x => tools.includes(x));
    };
};

