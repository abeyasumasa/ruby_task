class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "勝負手を選択してください"
    puts ("0:グー")
    puts ("1:チョキ")
    puts ("2:パー")
    input_hand = gets.chomp
    if input_hand == "0" || input_hand == "1" || input_hand == "2"
      player_hand = input_hand.to_i
    else
      puts("0〜2までの数字を入力してください")
      hand
    end
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    enemy = [0,1,2]
    enemy_hand = enemy.sample
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    hand=["グー","チョキ","パー"]
    judge = (player_hand - enemy_hand +3) %  3
    #じゃんけんプログラム
       if  judge==0
         puts("あいこです。再度勝負手を選択してください")
          player = Player.new
          enemy = Enemy.new
          janken = Janken.new
          janken.pon(player.hand, enemy.hand)
       elsif  judge==1
         puts("相手の手は#{hand[enemy_hand]}です。あなたの負けです。")
       elsif judge==2
         puts("相手の手は#{hand[enemy_hand]}です。あなたの勝ちです。")
       end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)
# ここに書かれているRubyの記述はあくまでヒントとして用意された雛形なので、書かれている記述に従わずに実装したいという場合は、自分の好きに実装して構わない。課題要件を満たし、コードの品質が一定の水準にあると判定されればどのような実装でも合格になる。
