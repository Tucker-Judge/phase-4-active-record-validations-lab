class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction), error: "shoulda-matchers test string"}
    validate :clickbait?


    # def clickbait?
    #     object = {string: ["Won't Believe","Secret Top [number]","Guess"]}
    #     if title == object[string]
    #         return true
    #     end
    # return true
    # end
    def clickbait?
        mapping = ["Won't Believe","Secret Top [number]","Guess"]
        if mapping.any? {|phrase| title.includes?(phrase)}
        return 
    else errors.add(:title, "title must be clickbait")
        end
        
    end
end
