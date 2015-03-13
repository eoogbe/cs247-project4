class Note < ActiveRecord::Base
  enum category: [:one_on_one, :general, :observation]
  enum privacy_status: [:private_, :public_]
  enum resolution: [:unresolved, :resolved]
  enum importance: [:low, :med, :high]
  enum mood: [:bad, :neutral, :good, :na]
  
  belongs_to :student
  belongs_to :user
  has_many :comments

  
  validates_presence_of :category, :privacy_status, :resolution, :importance,
    :mood, :student, :user
  
  def self.emotion_moods
    [:bad, :neutral, :good]
  end
  
  def self.has_emotion_moods?
    where.not(mood: moods[:na]).exists?
  end
  
  def self.good_mood_count
    emotion_mood_count(:good)
  end

  def self.neutral_mood_count
    emotion_mood_count(:neutral)
  end

  def self.bad_mood_count
    emotion_mood_count(:bad)
  end
  
  def self.good_mood_percent
    emotion_mood_percent(:good)
  end
  
  def self.neutral_mood_percent
    emotion_mood_percent(:neutral)
  end
  
  def self.bad_mood_percent
    emotion_mood_percent(:bad)
  end
  
  def self.with_text
    where.not(text: "")
  end
  
  def self.has_text?
    with_text.exists?
  end
  
  def author_name
    user.name
  end
  
  private
  
  def self.emotion_mood_percent mood
    (where(mood: moods[mood]).count * 100.0 / where.not(mood: moods[:na]).count).to_i
  end

  def self.emotion_mood_count mood
    where(mood: moods[mood]).count
  end
end
