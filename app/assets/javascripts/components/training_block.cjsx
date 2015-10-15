React = require 'react'
md    = require('markdown-it')({ html: true, linkify: true })

TrainingBlock = React.createClass(
  displayName: 'TrainingBlock'
  render: ->
    if @props.editable
      modules = _.compact(@props.all_modules).map (module) -> (
        <option id={module.id} value={module.id}>{module.name}</option>
      )
      selectVal = @props.block.training_module_id
      content = (
        <label className="select_wrapper training_module_select">
          Module Name:&nbsp;
          <select ref="module_select" value={selectVal} onChange={@props.onChange}>
            {modules}
          </select>
        </label>
      )
    else
      if @props.module?.name
        link = "/training/students/#{@props.module?.slug}"
        raw_html = md.render(@props.module?.intro)
        content = (
          <div>
            <p>{@props.module?.name}</p>
            <div dangerouslySetInnerHTML={{__html: raw_html}}></div>
            <hr />
            <p><a href={link}>Go to training</a></p>
          </div>
        )

    <div>
     {content}
    </div>

)

module.exports = TrainingBlock