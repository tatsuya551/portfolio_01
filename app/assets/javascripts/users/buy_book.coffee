window.draw_buy_book_graph = -> 
    ctx = document.getElementById("buyBookChart").getContext('2d')
    buyBookChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["7月", "8月", "9月", "10月", "11月", "12月"],
            datasets: [{
                label: '買った本',
                data: [1, 5, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 99, 132, 0.2)'
                ],
                borderWidth: 0
            }]
        },
        options: {
          scales: {
            xAxes: [{
              display: true,
              stacked: false,
              gridLines: {
                display: false
              }
            }],
            yAxes: [{
              gridLines: {
                display: false
              },
              ticks: {
                beginAtZero: true
                max : 10,
                stepSize: 5
              }
            }]
          }
        }
    })