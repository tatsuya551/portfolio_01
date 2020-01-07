window.draw_category_graph = -> 
    ctx = document.getElementById("categoryChart").getContext('2d')
    categoryChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ["小説", "経営戦略", "政治経済", "ファイナンス", "IT", "自己啓発", "タレント本", "その他"],
            datasets: [{
                label: '# of Votes',
                data: [gon.novel, gon.management, gon.economy, gon.finance, gon.it, gon.motivation, gon.talent, gon.etc],
                backgroundColor: [
                    'rgba(209, 46, 31, 0.6)',
                    'rgba(246, 202, 6, 0.7)',
                    'rgba(187, 212, 26, 0.7)',
                    'rgba(0, 146, 80, 0.7)',
                    'rgba(0, 131, 174, 0.7)',
                    'rgba(50, 97, 171, 0.7)',
                    'rgba(143, 51, 150, 0.7)',
                    'rgba(182, 25, 114, 0.6)'
                ],
                borderWidth: "0",
            }]
        },
        options: {
          cutoutPercentage: 65,
          title: {
            display: false,
            text: '登録ジャンル',
            fontSize: 14
          },
          legend: {
            position: "right",
            align: "center"
            labels: {
              fontSize: 12
              boxWidth: 25
              padding: 10
            }
          }
        }
    })