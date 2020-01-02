window.draw_mini_category_graph = -> 
    ctx = document.getElementById("miniCategoryChart").getContext('2d')
    ctx.canvas.height = 130;
    ctx.canvas.width = 110;
    miniCategoryChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ["小説", "経営戦略", "政治経済", "ファイナンス", "IT", "自己啓発", "タレント系", "その他"],
            datasets: [{
                label: '# of Votes',
                data: [100, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
            }]
        },
        options: {
          responsive: false,
          cutoutPercentage: 65,
          title: {
            # display: true,
            # text: 'ジャンル別'
            # fontSize: 14
          },
          legend: {
            position: "top",
            labels: {
              fontSize: 0
              boxWidth: 0
            }
          }
        }
    })