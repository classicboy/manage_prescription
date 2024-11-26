module SearchInputHelper
  # rubocop:disable Layout/LineLength
  def search_tag(field, value = nil, options = {})
    placeholder = options[:placeholder]
    input_class = "pl-10 py-2 h-10 rounded-md border-gray-300 focus:ring focus:ring-1 focus:ring-opacity-50 #{options[:input_class]}"

    content_tag(:div, class: "relative") do
      concat(content_tag(:div, search_icon,
                         class: "pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3"))
      concat(capture { search_field_tag(field, value, placeholder:, class: input_class) })
    end
  end

  private

  def search_icon
    tag.svg(width: "20", height: "20", viewBox: "0 0 20 20", fill: "none", xmlns: "http://www.w3.org/2000/svg") do
      tag.path(fill_rule: "evenodd", clip_rule: "evenodd",
               d: "M8 2C4.68629 2 2 4.68629 2 8C2 11.3137 4.68629 14 8 14C11.3137 14 14 11.3137 14 8C14 4.68629 11.3137 2 8 2ZM0 8C0 3.58172 3.58172 0 8 0C12.4183 0 16 3.58172 16 8C16 9.84871 15.3729 11.551 14.3199 12.9056L19.7071 18.2929C20.0976 18.6834 20.0976 19.3166 19.7071 19.7071C19.3166 20.0976 18.6834 20.0976 18.2929 19.7071L12.9056 14.3199C11.551 15.3729 9.84871 16 8 16C3.58172 16 0 12.4183 0 8Z", fill: "#555555")
    end
  end
  # rubocop:enable Layout/LineLength
end
