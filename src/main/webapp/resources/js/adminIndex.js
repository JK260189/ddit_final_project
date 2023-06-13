if (typeof jQuery === "undefined") {
    throw new Error("jQuery plugins need to be before this file");
}
$(function() {
    "use strict";
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
    
    // 접속자 변동 내역
    $(document).ready(function() { 
        var options = {
            series: [{
                name: '접속자 수',
                data: [4, 19, 7, 35, 14, 27, 9, 12],
            }],
                chart: {
                height: 140,
                type: 'line',
                toolbar: {
                    show: false,
                }
            },
            grid: {
                show: false,
                xaxis: {
                    lines: {
                        show: false
                    }
                },   
                yaxis: { 
                    lines: {
                        show: false
                    }
                }, 
            },
            stroke: {
                width: 4,
                curve: 'smooth',
                colors: ['var(--chart-color2)'],
            },
            xaxis: {
                type: 'datetime',
                categories: ['5/6/2023', '6/6/2023', '7/6/2023', '8/6/2023', '9/6/2023', '10/6/2023', '11/6/2023', '12/6/2023'],
                tickAmount: 10,
                labels: {
                    formatter: function(value, timestamp, opts) {
                        return opts.dateFormatter(new Date(timestamp), 'dd MMM')
                    }
                }
            },
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    gradientToColors: [ "var(--chart-color3)" ],
                    shadeIntensity: 1,
                    type: 'horizontal',
                    opacityFrom: 1,
                    opacityTo: 1,
                    stops: [0, 100, 100, 100],
                },
            },
            markers: {
                size: 3,
                colors: ["#FFA41B"],
                strokeColors: "#ffffff",
                strokeWidth: 2,
                hover: {
                    size: 7,
                }
            },
            yaxis: {
                show: false,
                min: -10,
                max: 50,
            }
        };

        var chart = new ApexCharts(document.querySelector("#apex-emplyoeeAnalytics11"), options);
        chart.render();
    });  

    // 유료회원
    $(document).ready(function() {
        var options = {
            align: 'center',
            chart: {
                height: 250,
                type: 'donut',
                align: 'center',
            },
            labels: ['기본회원', '회사소속 회원'],
            dataLabels: {
                enabled: false,
            },
            legend: {
                position: 'bottom',
                horizontalAlign: 'center',
                show: true,
            },
            colors: ['var(--chart-color4)', 'var(--chart-color3)'],
            series: [selMemChartNum-comMemChartNum, comMemChartNum],
            responsive: [{
                breakpoint: 480,
                options: {
                    chart: {
                        width: 200
                    },
                    legend: {
                        position: 'bottom'
                    }
                }
            }]
        }
        var chart = new ApexCharts( document.querySelector("#apex-MainCategories11"),options);        
        chart.render();
    }); 
    
    // 매출
  $(document).ready(function() {
        var options = {
            align: 'center',
            series: salesItemCNT,
            responsive: [{
                breakpoint: 420,
                options: {
                    chart: {
                        width: 200,
                        align: 'center',
                    },
                    legend: {
                        position: 'bottom',
                        markers: {
                            fillColors:'var(--chart-color1)'
                        },
                        labels: {
                            colors: 'var(--chart-color1)'
                        },
                    }
                }
            }],
            chart: {
                height: 336,
                type: 'polarArea',
                toolbar: {
                    show: false,
                },
            },
            labels: ['Test Plan', 'Premium Plan', 'Standard Plan', 'Basic Plan' ],
            fill: {
                opacity: 1,
                colors: ['var(--chart-color1)', 'var(--chart-color2)', 'var(--chart-color3)',  'var(--chart-color5)'],
            },
            stroke: {
                width: 1,
                colors: undefined
            },
            yaxis: {
                show: false
            },
            legend: {
                position: 'bottom', // left, right, top, bottom
                horizontalAlign: 'center',  // left, right, center
            },
            plotOptions: {
                polarArea: {
                    rings: {
                        strokeWidth: 0
                    }
                }
            },
            theme: {
                monochrome: {
                enabled: true,
                shadeTo: 'light',
                shadeIntensity: 0.6
                }
            }
        };

        var chart = new ApexCharts(document.querySelector("#incomeanalytics11"), options);
        chart.render();
    }); 
    
    // 구독현황
$(document).ready(function() {
    var options = {
        chart: {
            height: 350,
            type: 'line',
            toolbar: {
                show: false,
            },
        },
        colors: ['var(--chart-color1)', 'var(--chart-color2)'],
        series: [{
            name: '월별 신규 회원',
            type: 'column',
            data: [JoinMemberJANUARY, JoinMemberFEBRUARY, JoinMemberMARCH, JoinMemberAPRIL, JoinMemberMAY, joinMemberJUNE, joinMemberJULY, joinMemberAUGUST, joinMemberSEPTEMBER, joinMemberOCTOBER, joinMemberNOVEMBER, joinMemberDECEMBER]
        }, {
            name: '월별 신규 구독',
            type: 'line',
            data: [subscribeJANUARY, subscribeFEBRUARY, subscribeMARCH, subscribeAPRIL, subscribeMAY, subscribeJUNE, subscribeJULY, subscribeAUGUST, subscribeSEPTEMBER, subscribeOCTOBER, subscribeNOVEMBER, subscribeDECEMBER]
        }],
        stroke: {
            width: [0, 4]
        },        
        // labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        labels: ['01 Jan 2023', '02 Jan 2023', '03 Jan 2023', '04 Jan 2023', '05 Jan 2023', '06 Jan 2023', '07 Jan 2023', '08 Jan 2023', '09 Jan 2023', '10 Jan 2023', '11 Jan 2023', '12 Jan 2023'],
        xaxis: {
            type: 'datetime'
        },
        yaxis: [{
            title: {
                text: 'Website Blog',
            },

        }, {
            opposite: true,
            title: {
                text: 'Social Media'
            }
        }]
    }
    var chart = new ApexCharts(
        document.querySelector("#apex-chart-line-column11"),
        options
    );

    chart.render();
	});
});
    
