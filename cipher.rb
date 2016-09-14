def cipher(string, shift)
  encryption = []
  
  string.each_char do |char|
    if alphabet.include? char
      original = char.ord 
      if original.between?(65,90)
        encryption << encrypt(original, shift, 65).chr
      elsif original.between?(97,122)
        encryption << encrypt(original, shift, 97).chr
      end
    else
      encryption << char
      next
    end
  end
  
  encryption.join
end

def encrypt(original, shift, threshold)
  (original + shift - threshold) % 26 + threshold
end

def alphabet
  ("A".."Z").to_a + ("a".."z").to_a
end

cipher("Guru Lahima lived 4000 years ago in the Northern Air Temple. It is said that he unlocked the secrets of weightlessness and became untethered from the earth, living his final 40 years without ever touching the ground. Like all great childrens tales, it contains truth within the myth. Lahima once wrote, Instinct is a lie told by a fearful body, hoping to be wrong. It means, that when you base your expectations only on what you see, you blind yourself to the possibilities of a new reality.", -5)
cipher("Bpmp Gvcdhv gdqzy 4000 tzvmn vbj di ocz Ijmoczmi Vdm Ozhkgz. Do dn nvdy ocvo cz pigjxfzy ocz nzxmzon ja rzdbcogznniznn viy wzxvhz piozoczmzy amjh ocz zvmoc, gdqdib cdn adivg 40 tzvmn rdocjpo zqzm ojpxcdib ocz bmjpiy. Gdfz vgg bmzvo xcdgymzin ovgzn, do xjiovdin ompoc rdocdi ocz htoc. Gvcdhv jixz rmjoz, Dinodixo dn v gdz ojgy wt v azvmapg wjyt, cjkdib oj wz rmjib. Do hzvin, ocvo rczi tjp wvnz tjpm zskzxovodjin jigt ji rcvo tjp nzz, tjp wgdiy tjpmnzga oj ocz kjnndwdgdodzn ja v izr mzvgdot.", 5)
