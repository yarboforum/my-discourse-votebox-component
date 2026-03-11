import { apiInitializer } from "discourse/lib/api";

const VotesHeaderCell = <template>
  <th class="topic-list-data votes-left-header">Votes</th>
</template>;

const VotesItemCell = <template>
  <td class="topic-list-data votes-left-cell">
    {{#if @topic.can_vote}}
      <div class="votes-left-wrap">
        <VoteBox @topic={{@topic}} />
      </div>
    {{else}}
      <div class="votes-left-fallback">
        {{@topic.vote_count}}
      </div>
    {{/if}}
  </td>
</template>;

export default apiInitializer("1.34", (api) => {
  api.registerValueTransformer("topic-list-columns", ({ value: columns }) => {
    columns.add("votes-left", {
      header: VotesHeaderCell,
      item: VotesItemCell,
    });

    columns.reposition("votes-left", { before: "topic" });

    return columns;
  });
});
