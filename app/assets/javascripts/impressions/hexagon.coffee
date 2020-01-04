window.draw_hexagon_graph = -> 
    ctx = document.getElementById("hexagonChart").getContext('2d')
    hexagonChart = new Chart(ctx, {
        type: 'radar',
        data: {
            labels: ["面白さ・"+gon.interest, "感動・"+gon.impressed, "気付き・"+gon.awareness, "衝撃度・"+gon.impact, "実践度・"+gon.practice, "知識の深さ・"+gon.knowledge],
            datasets: [{
                label: '',
                data: [gon.interest, gon.impressed, gon.awareness, gon.impact, gon.practice, gon.knowledge],
                backgroundColor: [
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)'
                ],
                borderColor: [
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)'
                ],           
                pointBackgroundColor: [
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)',
                    'rgba(209, 46, 31, 0.8)'
                ],
                radius: [3, 3, 3, 3, 3, 3],
                borderWidth: [1, 1, 1, 1, 1, 1],
                pointStyle: ["rectRounded", "rectRounded", "rectRounded", "rectRounded", "rectRounded", "rectRounded"]
                
            }]
        },
        options: {
          cutoutPercentage: 50,
          title: {
            display: false,
            text: '5点満点中'
            fontSize: 14
          },
          pointLabels: {
            display: true,
            fontSize: 20
          },
          legend: {
            display: false,
          },
          scale: {
            ticks: {
              display: false,
              max: 5,
              min: 0,
              stepSize: 1
            },
            gridLines: {
              display: true,
              color: 'rgba(0, 46, 31, 0.2)',
              drawOnChartArea: false,
            },
            pointLabels: {
              display: true,
              fontSize: 12,
            }
          }
        }
    })