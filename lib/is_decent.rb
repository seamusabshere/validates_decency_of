class String
  INDECENT_WORDS = %w(shit piss fuck cunt cocksucker motherfucker tits)
  def is_decent?
    essence = self.downcase.gsub(/[^\.\'a-zA-Z]/, '')
    INDECENT_WORDS.detect { |c| essence.include? c }.nil?
  end
end
