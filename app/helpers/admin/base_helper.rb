module Admin::BaseHelper
    def formatted_date(date)
        if date.is_a?(Date)
            return date.strftime("%d.%m.%Y")
        else
            begin
                return date.to_date.strftime("%d.%m.%Y")
            rescue => e
                return Time.at(0).to_date.strftime("%d.%m.%Y")
            end
        end
    end
end
